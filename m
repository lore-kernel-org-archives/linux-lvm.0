Message-ID: <39053E22.D84F870F@netconnect.com.au>
Date: Tue, 25 Apr 2000 16:41:38 +1000
From: bug1 <bug1@netconnect.com.au>
MIME-Version: 1.0
Subject: [linux-lvm] mounting lv's from fstab
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: "linux-lvm@msede.com" <linux-lvm@msede.com>

I put all my logical volumes in /etc/fstab but it doesnt work
automatically.

Everytime i restart my machine i have to manually activate my volume
group by typing vgchange -a y archive.

Is there a way of automatically doing this with lvm or would i have to
write an init script ?


Thanks

Glenn McGrath
