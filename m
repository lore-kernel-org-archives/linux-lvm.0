Message-ID: <20011002200722.18323.qmail@web14404.mail.yahoo.com>
Date: Tue, 2 Oct 2001 13:07:22 -0700 (PDT)
From: Aman Shahi <shahi_aman@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] Re: linux2.4.10/lvm1.0.1rc3 does not compile
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

If I am not mistaken. the function 
static void __upadte_hardsectsize(lv_t *lv) 
has been declared and called as it is in lvm.c. But in
the definition it has been written as 
static void __update_hardblocksize(lv_t *lv)

so changing __update_hardblocksize(lv_t *lv)
in ~/LVM/1.0.1-rc3/kernel/lvm.c and
~linux-2.4.10/drivers/md/lvm.c 
to  __update_hardsectsize(lv_t *lv)
should resolve this compilation problem.

regards,
Aman Shahi.

>LVM 1.0.1rc3 does not compile (link) with Linux
2.4.10 >on my system.

>Does anyone know what went wrong?
>Regards, Markus



__________________________________________________
Do You Yahoo!?
Listen to your Yahoo! Mail messages from any phone.
http://phone.yahoo.com
