Message-ID: <3F133985.C98897C@eti.net.gn>
From: "ETI - Barry Irchad Kader" <ikbarry@eti.net.gn>
MIME-Version: 1.0
Subject: [linux-lvm] Very newbie question (LVM+NFS)
Content-Transfer-Encoding: 7bit
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
Date: Mon Jul 14 18:20:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi, List!

I apologize a lot if my question has been already answered in this
mailing list. The archive is not searchable, and the search engines
didn't answer plently to my particular problem...

So here it goes.

I have multiple pcs running NFS server and one pc running NFS client.
This client-pc (named master server) can access to the remote
directories of the machines running NFS server.

Here is how my /etc/fstab is designed on the master server:

#/etc/fstab (master server)
192.168.1.2:/home/share    /mnt/192.168.1.2    nfs
rsize=8192,wsize=8192,timeo=14
192.168.1.3:/home/share    /mnt/192.168.1.3    nfs
rsize=8192,wsize=8192,timeo=14
192.168.1.4:/home/share    /mnt/192.168.1.4    nfs
rsize=8192,wsize=8192,timeo=14
192.168.1.5:/home/share    /mnt/192.168.1.5    nfs
rsize=8192,wsize=8192,timeo=14
192.168.1.6:/home/share    /mnt/192.168.1.6    nfs
rsize=8192,wsize=8192,timeo=14

I would like to know if it is possible, then, to use LVM in order to
aggregate all these nfs partitions onto one single volume.

Thanks in advance for any answer. And sorry again if this has been
already answered in this mailing list.

Best regards,
Kader.
