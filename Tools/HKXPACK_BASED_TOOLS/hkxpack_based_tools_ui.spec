# -*- mode: python -*-

block_cipher = None


a = Analysis(['E:\\PersonalWork\\MODDING\\GAMES\\FO4\\ShadeAnimator_Fallout4_AnimationKit\\Tools\\HKXPACK_BASED_TOOLS\\hkxpack_based_tools_ui.py'],
             pathex=['E:\\PersonalWork\\MODDING\\GAMES\\FO4\\ShadeAnimator_Fallout4_AnimationKit\\Tools\\HKXPACK_BASED_TOOLS'],
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
          name='hkxpack_based_tools_ui',
          debug=False,
          strip=False,
          upx=True,
          console=True )
