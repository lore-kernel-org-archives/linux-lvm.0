From: "Erick Calder" <e@arix.com>
Subject: RE: [linux-lvm] core dumps with rc1
Date: Thu, 30 Aug 2001 21:49:35 -0700
Message-ID: <002801c131d8$56abef50$0300000a@pacbell.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <OF3B538C3F.FFBCD136-ON85256AB8.0077BD7D@raleigh.ibm.com>
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

my bad.  rebooted everything looks good.  thx Kevin.

-----Original Message-----
From:	linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com] On
Behalf Of Kevin M Corry
Sent:	Thursday, August 30, 2001 2:51 PM
To:	linux-lvm@sistina.com
Subject:	Re: [linux-lvm] core dumps with rc1

From your fdisk output, it looks like you tried to modify the partition
table of the drive with your root filesystem (or any other filesystem that
happened to be mounted). I'd first take the advise from fdisk and reboot
your machine just to be sure the new partition tables are updated in
memory. Then try the pvcreate again and see if it is still core dumping.

-Kevin
