From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] What is the state of lvm in 2.4.15-pre3?
Message-ID: <20011112083843.A624@tykepenguin.com>
References: <20011112004154.EF77AA3AE1@oscar.casa.dyndns.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011112004154.EF77AA3AE1@oscar.casa.dyndns.org>; from tomlins@cam.org on Sun, Nov 11, 2001 at 07:41:52PM -0500
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
Date: Mon Nov 12 02:37:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Nov 11, 2001 at 07:41:52PM -0500, Ed Tomlinson wrote:
> Hi
> 
> I noticed that pre3 contained a large update to lvm.  With this update
> what is the state of lvm?  What set of utilites should be used with 
> pre3 (rc4?).

That looks to me like the update from Alan's kernel and so is very up-to-date
(slightly behind CVS but that's no bad thing!).

Use the 1.0.1rc4 tools and don't bother to patch that kernel for LVM. 

patrick
