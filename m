Message-Id: <200204131240.g3DCefr21304@lorus.lonx.net>
From: Dan Amthor <groups@lonx.net>
Subject: Re: [linux-lvm] vgscan segfault at bootup
References: <20020412140325.L1346@tui.easy-call.net>
In-Reply-To: <20020412140325.L1346@tui.easy-call.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Date: Sat Apr 13 07:39:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Friday 12 April 2002 14:03, you wrote:
> Yesterday, after some time, I tried to boot SuSE 7.3. During bootup,
> vgscan secfaulted, leaving me without /usr, /opt and /home, which is
> not really useful. What do I need to do to recover? At least most of
> the VGs are used by both systems and I do not want to destroy them.
Hi, could not follow all the thread, just as a snippet. I had this occur 
and I disabled vgscan ("mv /sbin/vgscan /sbin/vgscan.BROKEN; echo "vgscan is 
kaputt" > /sbin/vgscan") 
That sort of handeled it, as vgscan is not needed at bootup, a "vgchange -a 
y" is sufficient.

HTH 
Dan
