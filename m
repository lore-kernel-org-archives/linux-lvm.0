Message-ID: <B45465FD9C23D21193E90000F8D0F3DF6834DF@mailsrv.linkvest.ch>
From: Jean-Eric Cuendet <Jean-Eric.Cuendet@linkvest.com>
Subject: [linux-lvm] ReiserFS/XFS/JFS, LVM, Raid5
Date: Mon, 26 Jun 2000 13:14:15 +0200
MIME-Version: 1.0
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@msede.com'" <linux-lvm@msede.com>


Hi,
I'd like to build such a system:
- Kernel + root on non-LVM Raid0/ext2 partition (no problemo)
A big partition (100Gb) which lokks like:
- Raid5 (linux md)
- LVM
- filesystem

It's a classic schema, but my question is:
Does anyone already tried it?
Any success? failure? Drawback?
Does XFS + LVM or JFS + LVM or ReiserFS + LVM be stable enough for
production?
Do they all have resize tools?

Thanks
-jec

_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
Jean-Eric Cuendet
Linkvest SA
Av des Baumettes 19, 1020 Renens Switzerland
Tel +41 21 632 9043  Fax +41 21 632 9090
http://www.linkvest.com  E-mail: jean-eric.cuendet@linkvest.com
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
