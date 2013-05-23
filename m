Message-ID: <519DD48B.5000801@redhat.com>
Date: Thu, 23 May 2013 10:34:19 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <knkd3m$5kr$1@ger.gmane.org>
In-Reply-To: <knkd3m$5kr$1@ger.gmane.org>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] snapshot an lvm disk containing ext4 partitions
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Alexis <alexis.pellicier@nds.k12.tr>

Dne 23.5.2013 08:31, Alexis napsal(a):
> Hello,
>
> I was use to snapshot an LVM volume containing ext4 partitions for backup
> purpose. This is a disk for Xen DomU paravirtualized linux box.
>
> With lvm-2.02.98 and kernel  3.4.11 from opensuse 12.2 the ext4 partitions
> inside  the snapshot were clean.
>
> Now I've upgraded to opensuse 12.3 (kernel 3.7.10 lvm-2.02.98)
>
> Is lvm supposed to keep my inside ext4 partitions clean when snapshotting my
> volume? If not is theire any way of doing this?
>
> Any advices welcome.

 From your description is not very clear who is creating 'snapshot'

If you pass a device to your XEN guest and you make a snapshot in your host,
than obviously host device view knows nothing about guest's ext4 filesystem.

I'm not an expert in paravirtualization here - but if you want to have clean
snapshot - you need to create then within the same environment used for 
filesystem - so your guest should be creating it.

There is not much host can do with guest's filesystem if you would be creating 
snapshot on the host while guest is pushing data to the filesystem.
You only get 'sync' but not filesystem freeze in this case.


Zdenek
