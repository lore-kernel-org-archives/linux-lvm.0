From: Ulrich Wiederhold <U.Wiederhold@gmx.net>
Message-Id: <20020212152744.GA30150@sky.net>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] cronjob and logcheck
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
Date: Tue Feb 12 09:24:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,
I have 2 questions:

1. What for is this cron-job?
*/10 *  * * *   root    /sbin/lvmsadc > /var/log/lvm >/dev/null 2>&1

2. I use logcheck and these msg are annoying:
Feb 12 14:20:01 home /USR/SBIN/CRON[28697]: (root) CMD (/sbin/lvmsadc >
/var/log/lvm >/dev/null 2>&1)

Why don't you create some logcheck "information" files in a next
lvm-version, that display the really important msg and ignore the usual
ones?


Thanks.
Uli

-- 
'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
