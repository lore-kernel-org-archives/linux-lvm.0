From: Paul <set@pobox.com>
Message-ID: <20021214231708.GB1432@squish.home.loc>
References: <20021213115014.GA15675@reti>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021213115014.GA15675@reti>
Subject: [linux-lvm] Re: New device-mapper patchset for 2.5.51
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
Date: Sat Dec 14 17:17:04 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Cc: Linux Mailing List <linux-kernel@vger.kernel.org>, lvm-devel@sistina.com, linux-lvm@sistina.com

Joe Thornber <joe@fib011235813.fsnet.co.uk>, on Fri Dec 13, 2002 [11:50:14 AM] said:
> If anyone was experiencing problems with dm could they please try this
> patchset and give me feedback.
> 
> Thanks,
> 
> - Joe
> 
> 
> 
> http://people.sistina.com/~thornber/patches/2.5-stable/2.5.51/2.5.51-dm-3.tar.bz2
> 

	Hi;

	I havent tried 2.5.51 vanila, but 2.5.51 with dm-3 patch
is working well so far for me on LVM system. (All other 2.5
kernels tried would hit a BUG()-- already reported.)
	If anyone wants me to recommend some sort of stress test
let me know; Ive simpley constructed and populated several
fileystems, md5sum'ed all the files, bzip2'd them, rm'd them,
etc. Then several hours of looping kernel compiles.
	Thanks for the work of the contributers.

Paul
set@pobox.com
