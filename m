Message-ID: <3BF3172B.EE4E60C3@gmx.net>
From: "Lars O. Grobe" <grobe@gmx.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] quota on LVM
References: <20011112183033.11789.qmail@web14604.mail.yahoo.com>
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
Date: Wed Nov 14 18:13:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi Pierre!

I use reiserfs on lvm on a raid5 (ibm serveraid 4m) with kernel 2.4.4.
Works fine. The only thing I found out is that you should use a new
quotautil from sourceforge, as the older 1.x only allow quotas < 2GB.

CU, Lars.
