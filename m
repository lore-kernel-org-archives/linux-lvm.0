Message-ID: <006001c20c05$0a41cf10$0300000a@STATION>
From: "Aslak Sommerfelt Skretting" <aslak@skretting.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] EXT2 to EXT3 LVM volume on Redhat
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Tue Jun  4 15:17:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hello.


I've been using LVM for almost a year now, and im extremely satisfied.

I use it on a Redhat 7.2 fileserver with the 2.4.18 kernel.

I've combined 6 ide drives into a logical volume /dev/storage/space with an
EXT2 filesystem on it, totalling around 650gb of storage.

What I am wondering is, would it be wise to convert this filesystem to EXT3?
Or are there risks involved when doing this?


As far as i can understand a simple:

tune2fs -j /dev/storage/space

would create a new journal file, and convert the filesystem to ext3. and a:

tune2fs -i 0 /dev/storage/space

would disable the fsck's that occur now and then (and takes an insane amount
of time on a 650gb filesystem), and are no longer necessary since the
filesystem is EXT3.

and then everything would be ok? or is there more that need to be done?


Is this a complicated process that i might just as well avoid in order not
to damage my data? Or is this pretty straightforward?




Regards

Aslak Sommerfelt Skretting
aslak@skretting.org
