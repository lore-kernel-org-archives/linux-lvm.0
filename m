From: Alexy Khrabrov <alexy.khrabrov@setup.org>
Message-ID: <20030402211019.GA4176@angle.setup.org>
References: <20030402164704.61870.qmail@web14403.mail.yahoo.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030402164704.61870.qmail@web14403.mail.yahoo.com>
Subject: [linux-lvm] /etc/fstab and noauto
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
Date: Wed Apr  2 15:10:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Greetings -- I successfully build a system where several
LVM volume groups correspond to external SCSI enclosures.
I often turn on the machine with those enclosures off,
but in order for that to happen, I have to comment out
their respective lines from /etc/fstab:

#/dev/black/black	/black		reiserfs	noauto,defaults 1 2
#/dev/slick/data	/slick		reiserfs	noauto,defaults 1 2
#/dev/quattro/span	/span		reiserfs	noauto,defaults 1 2

If I leave them in active, and don't turn on the enclosures,
the system stops for repair.  Does vgscan lok into /etc/fstab, and tries
to spin those drives for those groups even _regardless_ of noauto?
-- 
Cheers,
Alexy Khrabrov :: www.setup.org :: Age Quod Agis
