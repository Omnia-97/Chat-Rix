import 'package:chat_app/modules/base.dart';
import 'package:chat_app/modules/settings/setting_navigator.dart';
import 'package:chat_app/shared/database/database_utils.dart';

class SettingViewModel extends BaseViewModel<SettingNavigator> {
  Future<void> changePassword(String newPassword) async {
    try {
      navigator!.showLoading();
      await DataBaseUtils.changePassword(newPassword);
      navigator!.hideLoading();
      navigator!.showSuccessMassage('Password changed successfully');
      navigator!.hideLoading();
      navigator!.goToLogin();
    } catch (e) {
      navigator!.showErrorMassage(e.toString());
      navigator!.hideLoading();
    }
  }

  Future<void> deleteAccount() async {
    try {
     /* navigator!.showLoading();*/
      await DataBaseUtils.deleteUserAccount();
     /* navigator!.hideLoading();*/
      /*navigator!.showSuccessMassage('Account Deleted successfully');
      navigator!.hideLoading();*/
      navigator!.goToLogin();
    } catch (e) {
      navigator!.showErrorMassage(e.toString());
      navigator!.hideLoading();
    }
  }
}
