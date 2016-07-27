# -*- mode: python -*-

block_cipher = None


a = Analysis(['E:\\PersonalWork\\MODDING\\GAMES\\FO4\\ShadeAnimator_Fallout4_AnimationKit\\Tools\\F4AK_HKXPackUI\\f4ak_hkxpack_UI.py'],
             pathex=['E:\\PersonalWork\\MODDING\\GAMES\\FO4\\ShadeAnimator_Fallout4_AnimationKit\\Tools\\F4AK_HKXPackUI'],
             binaries=None,
             datas=None,
             hiddenimports=[],
             hookspath=[],
             runtime_hooks=[],
             excludes=[],
             win_no_prefer_redirects=False,
             win_private_assemblies=False,
             cipher=block_cipher)
pyz = PYZ(a.pure, a.zipped_data,
             cipher=block_cipher)
exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          name='f4ak_hkxpack_UI',
          debug=False,
          strip=False,
          upx=True,
          console=True )
