From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Looks like I have a problem with the dynamic linking with "lvcrea te"
Message-ID: <20011109180952.A30853@tykepenguin.com>
References: <D4B8B90F5DE4D511ADC40002A5097AA2109297@SPAWN>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <D4B8B90F5DE4D511ADC40002A5097AA2109297@SPAWN>; from amachon@cereva.com on Fri, Nov 09, 2001 at 09:48:51AM -0500
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
Date: Fri Nov  9 12:08:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Fri, Nov 09, 2001 at 09:48:51AM -0500, Machon, Anthony wrote:
> Stock RH 7.1 system, with GFS,LVM from sistina. 
> 
> When I move the lv_create function into lvcreate.c there is no problem with
> parameter passing,
> when it is in its true place in the library, the parameters get mangled
> 

It's a bug in the Red Hat compiler unfortunately. To work around it compile the
tools with optimisation disabled - replace -O2 with -O0

patrick
