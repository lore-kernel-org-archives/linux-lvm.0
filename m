From: Alasdair G Kergon <agk@uk.sistina.com>
Subject: Re: [linux-lvm] /etc/fstab and noauto
Message-ID: <20030402224207.E26952@uk.sistina.com>
References: <20030402164704.61870.qmail@web14403.mail.yahoo.com> <20030402211019.GA4176@angle.setup.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20030402211019.GA4176@angle.setup.org>; from alexy.khrabrov@setup.org on Wed, Apr 02, 2003 at 04:10:19PM -0500
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
Date: Wed Apr  2 15:42:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Apr 02, 2003 at 04:10:19PM -0500, Alexy Khrabrov wrote:
> #/dev/black/black	/black		reiserfs	noauto,defaults 1 2

Does it make any difference if you change the 2 at the end of each line 
into a 0?

Alasdair
-- 
agk@uk.sistina.com
