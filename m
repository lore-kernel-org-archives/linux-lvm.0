Message-ID: <20011119155741.7961.qmail@web12306.mail.yahoo.com>
From: Lars Kellogg-Stedman <thelars@yahoo.com>
Subject: Re: [linux-lvm] Recovering a volume after OS upgrade (lost /etc/lvm*)
In-Reply-To: <20011119014754.A1308@lynx.no>
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
Date: Mon Nov 19 09:56:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> You may need to re-create your MD RAID device /dev/md0.

The RAID device appears to be working just fine.  With the MD driver,
simply recreating /etc/raidtab and running raidstart worked without a
problem.

-- Lars


=====
lars@larsshack.org

__________________________________________________
Do You Yahoo!?
Find the one for you at Yahoo! Personals
http://personals.yahoo.com
