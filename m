Subject: RE: [linux-lvm] resize of ext3 filesytem
MIME-Version: 1.0
From: Kjartan Reynir Hauksson <krh@os.is>
Message-ID: <OF6C70C392.37ED2601-ON00256E0E.0061BFE0-00256E0E.0061BFE7@svunta.os.is>
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
Date: Thu Jan  1 18:12:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com





>Hi Gurus,

Well I'm not a guru but I've used resize2fs without suffering any
casulties.

-Kjartan

>I am pretty new to the Linux world. I am trying
>to extend an "ext3" filesystem with 2.4G. So far I have extend the VG
>and then LV, but know the question is how can I extend the filesystem,
>without destorying the data or doing mke2fs again on it.
>I know there is a command "resize2fs", but not
>sure if it'll destroy the data or not. I really dont want to shrink the
 >LV first and then use "e2fsadm" (had I known this command before, i
>would have used it).
