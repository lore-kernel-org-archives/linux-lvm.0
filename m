Return-Path: <jay@lazy.accessus.net>
Date: Thu, 14 Dec 2000 15:10:05 -0600 (CST)
From: Jay Weber <jay@lazy.accessus.net>
Subject: Re: [linux-lvm] LVM and inactive snapshots.
In-Reply-To: <200012141314.OAA23601@e35.marxmeier.com>
Message-ID: <Pine.OSF.4.21.0012141509060.4212-100000@lazy.accessus.net>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> No. The kernel should not unmount because this may cause
> confusion and possibly corruption of user mode information
> (eg. /etc/mtab).
> 
> If a snapshot is dead the kernel could simply return an error
> (EIO?) for any access to the snapshot (which no longer exists).
> So the bahaviour would be well defined.

Ah, yes, this does seem more reasonable and does address the issue of the
bits that are left lying about.

> 
> 
> Michael
> 
> --
> Michael Marxmeier           Marxmeier Software AG
> E-Mail: mike@msede.com      Besenbruchstrasse 9
> Phone : +49 202 2431440     42285 Wuppertal, Germany
> Fax   : +49 202 2431420     http://www.msede.com/
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
