import os
run_file = '/global/common/software/m2650/nersc_python_install/built_python_all.sh'
scripts_dir = '/global/common/software/m2650/nersc_python_install/packages'
with open(run_file,'r') as fid:
    txt = fid.read()
txt = [t.strip().split('/')[-1] for t in txt.split('\n') if 'bash' in t]
scripts = [f for f in os.listdir(scripts_dir) if f.startswith('install_')]
str = '# add these lines\n' + '\n'.join(['bash packages/'+f for f in list(set(scripts) - set(txt))])
print str
