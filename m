Message-ID: <45805.80.67.170.17.1028895384.squirrel@rezo.net>
From: "Antoine" <antoine@rezo.net>
In-Reply-To: <44660.80.67.170.17.1028814831.squirrel@rezo.net>
References: <44660.80.67.170.17.1028814831.squirrel@rezo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Re: can't mount ext3 snapshot => needs_recovery flag always set on mounted ext3 partitions
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
Date: Fri Aug  9 07:15:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi again,

Well, I've found out. The problem was the snapshot had been created
while the original volume had the "needs_recovery" flag set. If I
destroy the snapshot and recreate it when the original volume doesn't
have this flag, then I can mount the snapshot.

Now the remaining problem is that, _as soon as_ the original ext3 volume
is mounted, it has the "needs_recovery" flag. That means I cannot create
a usable snapshot volume without first unmounting the original volume
(because otherwise I won't be able to mount the snapshot volume). Is
there a way to work around this, so as to make snapshots without taking
anything down ?

(btw : maybe all this should be put in the documentation ;-))

Regards

Antoine.


> Furthermore, there is another error message on the console :
>
> EXT2-fs: lvm(58,1): couldn't mount because of unsupported optional
> features (4).
> Please note : the original LV the snapshot is taken on has the option
> "noatime" set. Could the problems come from this one ?
