From: neuron <neuron@hollowtube.mine.nu>
Subject: Re: [linux-lvm] JFS or XFS
Message-Id: <20040116002242.47690445@souldaemon>
In-Reply-To: <20040115231819.49123.qmail@web41506.mail.yahoo.com>
References: <20040115231819.49123.qmail@web41506.mail.yahoo.com>
Mime-Version: 1.0
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
Date: Thu Jan 15 18:24:03 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

reiserfs, guaranteed personally.  Especially on a mail server.
I've used jfs, I crashed it twice on purpose (network swap, then disable network card), both times jfs failed to boot.  (this is because it trusts it's own journal, which a lot of people love about it, both times for me it was wrong..)
Personally I haven't had any problems with XFS though, but I haven't used it that much.

> Greetings list..... I am a new user to LVM running kernel 2.4.21 and
> lvm 1.0.7
> I have a brief question because I am used to ext2 and not new
> journaling 
> filesystems. Which would you recommend to use on a file mail or web
> server:
> JFS or XFS and why? Please include your personal experience with the 
> filesystems. Thank you so much.
> 
> ______________________________________________________________________ 
> Post your free ad now! http://personals.yahoo.ca
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
