From: "Mark H. Wood" <mwood@IUPUI.Edu>
Subject: Re: [linux-lvm] vgscan and initrd
In-Reply-To: <200306260753.h5Q7rm4J014403@ruby.ridersoft.net>
Message-ID: <Pine.LNX.4.55.0306261153470.19405@mhw.ULib.IUPUI.Edu>
References: <200306260753.h5Q7rm4J014403@ruby.ridersoft.net>
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
Date: Thu Jun 26 12:02:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Sounds like what I ran into not long ago.  (FAQ material?)  My VG was so
large that vgscan wanted to write out backup info. that was larger than
the free space in the initrd that Red Hat had set up.  It was suggested to
mount a tmpfs volume over /etc, and meanwhile I have been recreating the
initrd image leaving enough space to allow vgscan to run.

vgscan won't actually say it ran out of storage, but that's what was
happening here.

-- 
Mark H. Wood, Lead System Programmer   mwood@IUPUI.Edu
MS Windows *is* user-friendly, but only for certain values of "user".
