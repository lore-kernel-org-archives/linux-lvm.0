Subject: Re: [linux-lvm] question on lvextend
References: <20011219154622.31527.qmail@web14403.mail.yahoo.com>
From: Urs Thuermann <urs@isnogud.escape.de>
In-Reply-To: <20011219154622.31527.qmail@web14403.mail.yahoo.com>;
    from Aman Shahi on Wed, 19 Dec 2001 07:46:22 -0800 (PST)
Message-Id: <m2heqjabri.fsf@isnogud.escape.de>
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
Date: Sat Dec 22 02:43:01 2001
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Aman Shahi <shahi_aman@yahoo.com> writes:

> Can I extend a striped LV ?

Yes.  I've done so several times.

> If so, does the data gets redistributed or what ?

No.  There no need to move data from the LV around.  The LV just gets
a couple of new PEs assigned just as with non-striped LVs.  Only the
mapping of already allocated LEs to PEs is modified, e.g.

	before				after

	LE	PV	   PE		LE	PV	   PE
	00	/dev/sda1  00		00      /dev/sda1  00
	01	/dev/sda1  01		01      /dev/sda1  01
	02	/dev/sdb1  00		02      /dev/sda1  02
	03	/dev/sdb1  01		03      /dev/sdb1  00
					04      /dev/sdb1  01
					05      /dev/sdb1  02

Look at lvdisplay -v before and after running lvextend.


urs
