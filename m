Return-Path: <riel@conectiva.com.br>
Date: Fri, 6 Jul 2001 17:23:54 -0300 (BRST)
From: Rik van Riel <riel@conectiva.com.br>
Subject: Re: [linux-lvm] Book chapter
In-Reply-To: <web-730976@syroidmanor.com>
Message-ID: <Pine.LNX.4.33L.0107061722540.17825-100000@duckman.distro.conectiva>
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, 5 Jul 2001, Moshe Bar wrote:

> I am writing a chapter about LVM in my book. I would like to
> know more about the internal data structures and the
> algorithms used.
>
> Can you tell me more about them (next to what is in the
> source code) or point me to some document about the
> internals of LVM (interaction with VFS, etc.).

It's a block device layer thing, so it doesn't interact
with the VFS. What the LVM layer _seems_ to do is simply
remap an IO request to the device it's supposed to go to
and let the request get into the IO layer again...

(then again, I could be wrong here, the LVM code isn't
the easiest to wade through)

Rik
--
Executive summary of a recent Microsoft press release:
   "we are concerned about the GNU General Public License (GPL)"


		http://www.surriel.com/
http://www.conectiva.com/	http://distro.conectiva.com/
