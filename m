Message-ID: <3B8B78AC.164BDA67@sap.com>
Date: Tue, 28 Aug 2001 12:55:40 +0200
From: Jan Schreckenbach <Jan.Schreckenbach@sap.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] extending striped lv
References: <20010823232349.9882.qmail@web20306.mail.yahoo.com> <20010824112859.A10992@dragon.blacknet.de> <20010827124212.C1308@sistina.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

AJ Lewis wrote:
> Nope, you can only extend a striped LV on the PV's it is currently on.
> After that you either have to pvmove it to larger PVs or rebuild with more
> disks.
> 
> If you want to be able to extend LVs and need software striping, you might
> want to consider using MD striping underneath LVM.
> 
AJ,

does this mean I can initially build a striped LV from two smaller
disks, let me say sda and sdb and later move the LE from sda to sdc
and from sdb to sdd (where sdc and sdb a bigger than sda/sdb)? 
It is to be said that the performance of md RAID0 is somewhat better
than from striped LV's but I would prefer LVM if I could extend
a striped LV without rebuilding RAID/restoring data.

cu,
Jan

--
_______________________________________________________________________

THE BEST RUN E-BUSINESSES RUN SAP
_______________________________________________________________________

Jan Schreckenbach                      email: Jan.Schreckenbach@sap.com
SAP AG Walldorf/Baden, Germany         Phone: +49 6227  7-47474
LinuxLab                               Fax  : +49 6227 78-31414

SAP LinuxLab support address: linux@sap.com
