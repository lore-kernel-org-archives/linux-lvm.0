Date: Tue, 18 Apr 2000 16:28:52 +0200
From: matthaes@pharos.hsp.de
Subject: [linux-lvm] Devfs and lvm problems
Message-ID: <20000418162852.A22888@pharos.hsp.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@msede.com

Hi,

I�ve built a kernel with lvm and devfs support and got some problems.

1.) devfsd doesn�t create /dev/vg00/group etc files, so vgchange -ay
    fails

2.) vgscan fails with 

vgscan -- found inactive volume group "vg00"
vgscan -- ERROR "lvm_remouverecursive(): opendir" removing volume group directory and special files
vgscan -- ERROR "lvm_remouverecursive(): opendir" creating "/etc/lvmtab" and "/etc/lvmtab.d"

Is it possible to marry devfs and lvm ?
And what is the Right Way (tm)

Thanks in advance
                 Ingo 
