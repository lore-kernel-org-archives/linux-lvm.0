Subject: Re: [linux-lvm] expanding on LVM2
Message-ID: <20030313192329.GA3721@fib011235813.fsnet.co.uk>
References: <200303131010.PAA28647@WS0005.indiatimes.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200303131010.PAA28647@WS0005.indiatimes.com>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Thu Mar 13 13:24:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Mar 13, 2003 at 04:00:37PM +0530, Sharad Tiwari wrote:
> hi all,
> 
> 
>        I have successfully installed LVM2 on linux 2.4.19. 
> 
> 
> I want to do some further work on that, and am not sure if that is already available, so could someone please elaborate on the availability of a kernel API / library in the userland, i.e What are the library exposed or the kernel APIs available for an lvm consumer who wants to add new functionalities or write customised LVM customised LVM administrative tool. Warm regards 

There is a small library called libdevmapper which you could use to
drive the kernel component directly.  LVM2 uses this, I think EVMS has
opted to use the ioctl commands directly.

There is not a library for LVM2, and neither are there plans to
produce one.  Your program should call the lvm2 tools themselves.  See
the vgs, pvs, lvs commands for ways to get easily parsable
information.

- Joe
