From: Janson Benjamin <janson@rumms.uni-mannheim.de>
Subject: [linux-lvm] lvm and quotas on SuSE 7.0
Message-ID: <974814963.3a1a7ef34be1a@rumms.uni-mannheim.de>
Date: Tue, 21 Nov 2000 14:56:03 +0100 (MET)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@msede.com

Hi,
this is probably an annoying beginners question, but I didn't find anything
about it in the FAQ.
Well my SuSE 7.0 linux box is setup with lvm and ext2 as underlying filesystem.
But the problem is, that the quotas don't work. I can define quotas with
edquota, but the system seems to be unable to recongnize how much space is used
by the specified user.
Without the lvm it worked. Has anyone an idea. Thanks a lot for your help.
Benjamin
