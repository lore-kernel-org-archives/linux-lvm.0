Message-ID: <20021101201601.61173.qmail@web14005.mail.yahoo.com>
From: Gayatri Prabhu <gayatri_prabhu@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] vgchange -- ERROR "parameter error"
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
Date: Fri Nov  1 14:16:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I read a few emails on this mailing list with the same
problem. I'm using LVM version 1.0.1-rc4, kernel
2.4.7, Redhat 7.2. I've been unable to activate a VG
since yesterday. I've been trying to recover data from
the VG using  the "pvcreate, vgcfgrestore, vgscan,
vgchange" procedure given as a solution to this
problem. I still get the following error:
vgchange -- ERROR "parameter error" setting up
snapshot copy on write exception table for
"/dev/vgtest/snap.02"

I've tried using all the old config files for this VG
in /etc/lvmconf, but even the oldest file has the
"messy" snapshot since the snapshot creation was being
done as part of an hourly cron job. 

I would appreciate it if you could let me know whether
there is any other way to still recover the data on
the disk ? Also, is there a later version of LVM in
which this problem has been fixed ?

Thanks,
Gayatri


__________________________________________________
Do you Yahoo!?
HotJobs - Search new jobs daily now
http://hotjobs.yahoo.com/
