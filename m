Message-ID: <20011119232513.5796.qmail@web12302.mail.yahoo.com>
From: Lars Kellogg-Stedman <thelars@yahoo.com>
Subject: Re: [linux-lvm] Recovering a volume after OS upgrade (lost /etc/lvm*)
In-Reply-To: <20011119095105.G1308@lynx.no>
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
Date: Mon Nov 19 17:23:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

> You saw the other posting about the MD devices fix?  This is fixed in
> CVS, but not 1.0.1rc4.  Maybe it is time for a new LVM release.

That appears to have fixed the problem; vgscan now detects the older
logical volume and I can mount it successfully.

Now I've got a new problem, but it's going in a new thread :).

-- Lars


=====
lars@larsshack.org

__________________________________________________
Do You Yahoo!?
Find the one for you at Yahoo! Personals
http://personals.yahoo.com
