From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] help: can't read name(s) of physical volumes (Debian kernel weirdness also involved)
Message-ID: <20021216081747.GA869@tykepenguin.com>
References: <20021215160028.GA7519@tykepenguin.com> <Pine.GSO.4.44L-027.0212151823290.10369-100000@unix3.andrew.cmu.edu>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.44L-027.0212151823290.10369-100000@unix3.andrew.cmu.edu>
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
Date: Mon Dec 16 02:17:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Dec 15, 2002 at 06:25:47PM -0500, Daniel J Hannum wrote:
> Thanks a ton. Debian needs to make their documentation more clear. When
> you install lvm, they say to either mount devfs (they don't say how) OR
> install devfsd. Turns out, that should be AND. I had to send the kernel
> param like you said. And it doesn't work without devfsd, either.

Actually it is possible to get it to work without devfsd but it's just too
annoying IMHO :)
 

patrick
