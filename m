Message-ID: <20040128163917.13042.qmail@web21402.mail.yahoo.com>
From: duane no-name <duanexbox@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] How To Question
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
Date: Wed Jan 28 11:41:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Perhaps this is more obvious to others - but it is not
obvious to me after reading the howtos and docs.

The Docs - common tasks section has part of my
answers, but it lacks what I believe to be a commbined
two step example.

Right now, I have a single /var/foo implimented as an
LVM vol using reiserfs. It turns out - I allocated too
much space to it.

I now need a /var/bar.

I'd like to re-allocate or shrink /var/foo by say 20G,
and give it to /var/bar.

The "How To" do this two step process is not very
clear in the docs.

I'm quite able to shrink and expand /var/foo - at
will. My confusion is - now that I have shrunk it -
reallocate the space I just got back?

What am i not reading correctly?

Thanks.


__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free web site building tool. Try it!
http://webhosting.yahoo.com/ps/sb/
