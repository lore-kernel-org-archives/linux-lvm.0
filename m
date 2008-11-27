Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mARASPER024124
	for <linux-lvm@redhat.com>; Thu, 27 Nov 2008 05:28:25 -0500
Received: from smtp004.apm-internet.net (smtp004.apm-internet.net
	[85.119.248.54])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id mARAS9cU006027
	for <linux-lvm@redhat.com>; Thu, 27 Nov 2008 05:28:09 -0500
Received: from bernoulli.globalphasing.com (bernoulli.globalphasing.com
	[192.168.131.101])
	by mailserv1.globalphasing.com (Postfix) with ESMTP id E95B8152A1
	for <linux-lvm@redhat.com>; Thu, 27 Nov 2008 10:28:04 +0000 (GMT)
Date: Thu, 27 Nov 2008 10:28:05 +0000 (GMT)
From: Peter Keller <pkeller@globalphasing.com>
Subject: Re: [linux-lvm] XFS_freeze and LVM
In-Reply-To: <E3E8DACD-916F-4A20-AE40-535AE1373326@idmedia.com>
Message-ID: <alpine.LNX.1.10.0811271006200.27683@bernoulli.globalphasing.com>
References: <OFEEAC56CA.4D4B448B-ONC125750E.00300773-C125750E.00305B8E@lippi.fr>
	<E3E8DACD-916F-4A20-AE40-535AE1373326@idmedia.com>
MIME-Version: 1.0
Content-Type: MULTIPART/Mixed; BOUNDARY="===============0608451742=="
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--===============0608451742==
Content-Type: TEXT/Plain; format="flowed"; charset="utf-8"
Content-Transfer-Encoding: 8bit

Hi,

IIRC sometime around 2005 developments in LVM meant that using xfs_freeze 
before creating a snapshot became the wrong thing to do. See the entry in 
the changelog for revision 0.15 of the LVM how-to at 
http://tldp.org/HOWTO/LVM-HOWTO/ . You will probably find that authoritative 
recommendations to use xfs_freeze relate to versions of LVM from before this 
time. (Please correct me if I am wrong about this, someone.)

Also bear in mind that filesystem transactions do not correspond to database 
(i.e. MySQL) transactions. To get a reliable backup using a snapshot you may 
need to allow uncommitted database transactions to complete or roll back 
while preventing new ones from being started, then take the snapshot. Oracle 
has a way of doing this that doesn't need the database to be completely shut 
down, but I have no experience with MySQL so I can't be more specific.

Good luck,
Peter.

On Thu, 27 Nov 2008, Falko Zurell wrote:

> Date: Thu, 27 Nov 2008 09:54:14 +0100
> From: Falko Zurell <falko.zurell@idmedia.com>
> Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
> To: LVM general discussion and development <linux-lvm@redhat.com>
> Subject: Re: [linux-lvm] XFS_freeze and LVM
> 
> Hi,
> are your LVM tools on the freezed file system? Is this the / partition you are
> freezing? Bad idea ;-)
> 
> kind regards
> 
> 
> 
> Am 27.11.2008 um 09:48 schrieb Antony MARTINEAU:
> 
>
>       Hello,
>       I want using LVM 2 and Mysql
>       So i have mounted /var/lib/mysql on /dev/vg0/mysql.
>
>       For doing a backup i want do
>       xfs_freeze -f /var/lib/mysql
>       and after : lvcreate --snapshot -n snap -L1G /dev/vg0/mysql.
>
>       But the problem is when i freeze xfs filesystem i can't use lvm commands...
>       When i unfreeze xfs lvm commands are available...
>
>       Do you know the problem?? is it a bug.??
>       Cordialement,
>
>                                       <ATT54517403.gif>
>
>       MARTINEAU
>       Antony
>       Service informatique
>       Assistant informatique
>       LIPPI Management La Fouillouse
>       16440 Mouthiers sur Boheme
>       Tel.: 05.45.67.34.35
>       Courriel: antony.martineau@lippi.fr
>       http://www.lippi.fr
> 
> 
> 
> 
>
>       [eco.jpg]
> 
>
>       Ce message et toutes les pieces jointes sont etablis a l'attention
>       exclusive de ses destinataires et sont strictement confidentiels. Pour en
>       savoir plus cliquer ici
>
>       This message and any attachments are confidential to the ordinary user of
>       the e-mail address to which it was addressed and may also be privileged.
>       More information
>
>       _______________________________________________
>       linux-lvm mailing list
>       linux-lvm@redhat.com
>       https://www.redhat.com/mailman/listinfo/linux-lvm
>       read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> Falko Zurell 
> 
> Head of Application Management
> 
> /i-d media AG
> Ohlauer Straße 43
> D-10999 Berlin
> 
> 
> 
> 
>

--
Peter Keller                                     Tel.: +44 (0)1223 353033
Global Phasing Ltd.,                             Fax.: +44 (0)1223 366889
Sheraton House,
Castle Park,
Cambridge CB3 0AX
United Kingdom
--===============0608451742==--
