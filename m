Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i1LDHZi00439
	for <linux-lvm@redhat.com>; Sat, 21 Feb 2004 08:17:35 -0500
Received: from gw.uk.sistina.com (gw.uk.sistina.com [62.172.100.98])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i1LDHYb26096
	for <linux-lvm@redhat.com>; Sat, 21 Feb 2004 08:17:34 -0500
Received: from agk by gw.uk.sistina.com with local (Exim 3.12 #1 (Debian))
	id 1AuX0f-0005ij-00
	for <linux-lvm@redhat.com>; Sat, 21 Feb 2004 13:17:33 +0000
From: Alasdair Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] Checking the change in lv layout
Message-ID: <20040221131733.A21968@uk.sistina.com>
References: <Law11-OE70ZCyymArWr00006c7d@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Law11-OE70ZCyymArWr00006c7d@hotmail.com>; from sachindurge@hotmail.com on Sat, Feb 21, 2004 at 12:51:07PM -0800
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Sat Feb 21 08:16:05 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Sat, Feb 21, 2004 at 12:51:07PM -0800, sachin wrote:
> I am more intrested in checking wether the disk layout of that lv
> changes or not also what should i assign as id to that lv for future
> comparision  of the lv configuration
 
Look at LVM2's text file backups (vgcfgbackup).

You can use that safely to *read* LVM1 on-disk metadata without
device-mapper in your kernel if you configure --disable-devmapper.

Alasdair
