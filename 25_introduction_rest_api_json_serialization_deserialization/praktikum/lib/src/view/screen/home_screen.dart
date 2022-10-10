import 'package:flutter/material.dart';
import 'package:praktikum/src/view/widget/user_card.dart';
import '../../model/user_request_model.dart';
import '../../model/user_model.dart';
import '../../service/reqres_service.dart';

class HomeScreen extends StatefulWidget {
  static const route = '/';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ReqResService _reqResService = ReqResService();
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _job = TextEditingController();

  List<UserModel> _users = [];
  String method = '';
  UserCreate? _userCreate;
  UserUpdate? _userUpdate;

  @override
  void dispose() {
    super.dispose();
    _name.dispose();
    _job.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API'),
      ),
      body: Column(
        children: [
          Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  TextFormField(
                    controller: _name,
                    decoration: const InputDecoration(
                      filled: true,
                      label: Text('Full Name'),
                    ),
                  ),
                  TextFormField(
                    controller: _job,
                    decoration: const InputDecoration(
                      filled: true,
                      label: Text('Job'),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          method = 'GET';
                          final users = await _reqResService.getAll();
                          _users = users.toList();
                          setState(() {});
                        },
                        child: const Text('GET'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          method = 'POST';
                          final userModel = UserCreate(
                            name: _name.text,
                            job: _job.text,
                          );

                          final user = await _reqResService.create(userModel);
                          _userCreate = user;
                          setState(() {});
                        },
                        child: const Text('POST'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          method = 'PUT';
                          final userModel = UserUpdate(
                            name: _name.text,
                            job: _job.text,
                          );
                          final user = await _reqResService.update(userModel);
                          _userUpdate = user;
                          setState(() {});
                        },
                        child: const Text('PUT'),
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          method = 'DELETE';
                          final statusCode = await _reqResService.remove();

                          if (mounted) {}

                          if (statusCode == 204) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('User Deleted'),
                              ),
                            );

                            _name.clear();
                            _job.clear();
                          }

                          setState(() {});
                        },
                        child: const Text('DELETE'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Text(
              'Result : Method $method',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Flexible(
            child: _buildResponse(),
          ),
        ],
      ),
    );
  }

  Widget _renderUsers() {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final user = _users[index];
        return ListTile(
          title: Text('${user.firstName} ${user.lastName}'),
          subtitle: Text(user.email),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(user.avatar),
          ),
        );
      },
      separatorBuilder: (context, index) => const Divider(),
      itemCount: _users.length,
    );
  }

  Widget _buildUserPost() {
    if (_userCreate != null) {
      return UserCard(
        name: _userCreate!.name,
        job: _userCreate!.job,
        dateTitle: 'Created At',
        dateAction: _userCreate!.createdAt!,
      );
    }

    return const SizedBox();
  }

  Widget _buildUserPut() {
    if (_userUpdate != null) {
      return UserCard(
        name: _userUpdate!.name,
        job: _userUpdate!.job,
        dateTitle: 'Update At',
        dateAction: _userUpdate!.updatedAt!,
      );
    }

    return const SizedBox();
  }

  Widget _buildResponse() {
    switch (method) {
      case 'GET':
        return _renderUsers();
      case 'POST':
        return _buildUserPost();
      case 'PUT':
        return _buildUserPut();
      case 'DELETE':
        return const SizedBox();
      default:
        return const SizedBox();
    }
  }
}
