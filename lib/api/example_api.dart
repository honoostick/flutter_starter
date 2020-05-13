import 'dart:io';
import 'package:flutter_starter/store/user.dart';
import 'package:provider/provider.dart';
import '../utils/request.dart';
import '../utils/utils.dart';
import '../utils/constant.dart';
import 'package:sprintf/sprintf.dart';
import 'package:path_provider/path_provider.dart';

class ExampleAPI {
  /**
   * hellow world
   */
   static Future<Map> helloWorld() async {
    try {
      return await request.get('/fs/test/hello').then((res) {
        if (res.statusCode == HttpStatus.ok) {
          // Utils.setLocalMap(LocalData.M_PROFILE_LOGIN, res.data);
          return Request.formatReturn(true, '成功', res.data);
        }
        return Request.formatReturn(false, res.data['msg'] ?? '失败', {});
      });
    } catch (e) {
      return Request.formatReturn(false, '错误', {});
    }
  }

  // 用户
  /*
   * 登录
   */
  static Future<Map> login(phone, password) async {
    try {
      return await request.post('/login/cellphone',
          data: {"phone": phone, "password": password}).then((res) {
        if (res.statusCode == HttpStatus.ok) {
          Utils.setLocalMap(LocalData.M_PROFILE_LOGIN, res.data);
          return Request.formatReturn(true, '登录成功', res.data);
        }
        return Request.formatReturn(false, res.data['msg'] ?? '登录失败', {});
      });
    } catch (e) {
      return Request.formatReturn(false, '登录错误', {});
    }
  }

  /*
   * 登出
   */
  static Future<Map> logout() async {
    try {
      return await request.post('/logout').then((res) {
        if (res.statusCode == HttpStatus.ok) {
          return Request.formatReturn(true, '登出成功', res.data);
        }
        return Request.formatReturn(false, res.data['msg'] ?? '登出失败', {});
      });
    } catch (e) {
      return Request.formatReturn(false, '登出错误', {});
    }
  }

  /*
   * 检查登录状态
   */
  static Future<Map> checkLoginStatus() async {
    try {
      return await request.post('/login/status').then((res) {
        if (res.statusCode == HttpStatus.ok) {
          Utils.setLocalMap(LocalData.M_PROFILE_CHECK, res.data);
          return Request.formatReturn(true, '当前已登录', res.data);
        }
        return Request.formatReturn(false, res.data['msg'] ?? '登录检查失败', {});
      });
    } catch (e) {
      return Request.formatReturn(false, '登录检查错误', {});
    }
  }

  // 歌曲
  /*
   * 获取排行榜
   */
  static Future<Map> getRankDetails(List likeList, [idx = 1]) async {
    try {
      return await request.get('/top/list?idx=$idx').then((res) {
        if (res.statusCode == HttpStatus.ok) {
          var playmap = res.data['playlist'];
          var tracks = playmap['tracks'].sublist(0, 5);
          for (int i = 0; i < tracks.length; i++) {
            tracks[i]['isLike'] = likeList.contains(tracks[i]['id']);
          }
          return Request.formatReturn(true, '排行榜[$idx]获取成功', {
            "tracks": tracks,
            "coverImgUrl": playmap['coverImgUrl'],
            "name": playmap['name'],
          });
        }
        return Request.formatReturn(false, res.data['msg'] ?? '排行榜获取失败', {});
      });
    } catch (e) {
      return Request.formatReturn(false, '排行榜获取错误', {});
    }
  }
}
