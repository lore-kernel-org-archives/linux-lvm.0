Return-Path: <thornber@btconnect.com>
Date: Sat, 7 Jul 2001 15:35:33 +0100
Subject: Re: [linux-lvm] Book chapter
Message-ID: <20010707153533.B444@btconnect.com>
References: <web-730976@syroidmanor.com> <Pine.LNX.4.33L.0107061722540.17825-100000@duckman.distro.conectiva>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33L.0107061722540.17825-100000@duckman.distro.conectiva>; from riel@conectiva.com.br on Fri, Jul 06, 2001 at 05:23:54PM -0300
From: Joe Thornber <thornber@btconnect.com>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Jul 06, 2001 at 05:23:54PM -0300, Rik van Riel wrote:
> On Thu, 5 Jul 2001, Moshe Bar wrote:
> 
> > I am writing a chapter about LVM in my book. I would like to
> > know more about the internal data structures and the
> > algorithms used.
> >
> > Can you tell me more about them (next to what is in the
> > source code) or point me to some document about the
> > internals of LVM (interaction with VFS, etc.).
> 
> It's a block device layer thing, so it doesn't interact
> with the VFS. What the LVM layer _seems_ to do is simply
> remap an IO request to the device it's supposed to go to
> and let the request get into the IO layer again...

Rik's correct, LVM has nothing to do with the VFS.  If you wish to explore
the code start with lvm_map() which maps a buffer destined for a logical 
volume onto a physical device.
 
> (then again, I could be wrong here, the LVM code isn't
> the easiest to wade through)

Agreed.

- Joe
