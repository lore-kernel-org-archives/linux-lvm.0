Subject: Re: [linux-lvm] How to migrate data from one Hard Drive to a new one
Message-ID: <9226-27988@sneakemail.com>
References: <1062272914.11039.103.camel@candido> <3F51BF42.6070403@silicide.dk> <1062451252.2391.28.camel@candido>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1062451252.2391.28.camel@candido>
From: "Wolfgang Weisselberg" <uzx87lvfmukwc001@sneakemail.com>
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
Date: Tue Sep  2 07:29:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Luca Da Col wrote 199 lines:

> 1) pvcreate /dev/hda5
> 2) vgextend Volume00 /dev/hda5

Ok, the Volume Group now has /dev/hda5 added.

> 3) lvextend  --size +97.4g /dev/Volume00/LogVol02 /dev/hda5

> but my /home is still 28G

Well, of course!
You have increased the partition (/dev/Volume00/LogVol02).
You have *not* increased the filesystem /home.

Instead of lvextend you should have used e2fsadm which runs both
lvextend and resize2fs (or ext2resize), and fsck, in the correct
order.  It's a good idea, generally, to umount /home first.

Please read the manpages of e2fsadm, resize2fs and ext2resize
for more information.

-Wolfgang
