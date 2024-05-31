/*
Padding(
padding: EdgeInsets.only(
top: 20.h,
),
child: Column(
children: [
Padding(
padding: EdgeInsets.symmetric(horizontal: 16.w),
child: Stack(
clipBehavior: Clip.none,
alignment: AlignmentDirectional.bottomEnd,
children: [
if (image != null) ...[
CircleAvatar(
radius: 35.r,
child: Image.file(
image!,
fit: BoxFit.cover,
),
),
] else ...[
CircleAvatar(
backgroundColor: AppColors.lightColor,
radius: 80.r,
child: Icon(
Icons.person,
color: AppColors.primaryColor,
size: 75.r,
),
),
],
Positioned(
top: 108.h,
//right: ,
child: InkWell(
onTap: () {
getImageFromGallery();
},
child: CircleAvatar(
backgroundColor: AppColors.primaryColor,
radius: 28.r,
child: const Center(
child: Icon(
Icons.camera_alt_outlined,
color: AppColors.lightColor,
size: 28,
),
),
),
),
),
],
),
),
SizedBox(
height: 28.h,
),

const CustomRowWidget(
text: 'Account',
hintText: 'Info about account', imagePath: AppImages.icUser,
),
*/
/* CustomRowWidget(
              text: 'Name',
              hintText: provider.userModel?.userName ?? 'Unknown', imagePath: AppImages.icUser,
            ),*//*

const CustomRowWidget(
text: 'Change Password',
hintText: 'Update your password',
imagePath: AppImages.icChangePassword,
),
const CustomRowWidget(
text: 'Privacy Policy',
hintText: 'Details about privacy policy', imagePath: AppImages.icPolicy,
),
const CustomRowWidget(
text: 'Delete Account',
hintText: 'Remove account permanently', imagePath: AppImages.icDeleteAccount,
),
const CustomRowWidget(
text: 'About Us',
hintText: 'Info about app', imagePath: AppImages.icAbout,
),

],
),
),*/
