Date: Wed, 29 Aug 2001 16:13:08 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Strange message with 2.4.8+1.0.1rc1
Message-ID: <20010829161308.G869@tykepenguin.com>
References: <B45465FD9C23D21193E90000F8D0F3DF0178FD30@mailsrv.linkvest.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <B45465FD9C23D21193E90000F8D0F3DF0178FD30@mailsrv.linkvest.com>; from Jean-Eric.Cuendet@linkvest.com on Wed, Aug 29, 2001 at 12:29:20PM +0200
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

On Wed, Aug 29, 2001 at 12:29:20PM +0200, Jean-Eric Cuendet wrote:
> 
> I haven't renamed it!
> What I made:
> 1st try:
> - create NORAID_HDX VG
> - create LV
> - reboot
> - VG not found by vgscan. NO way to restore it.
> 
> 2nd try:
> - create NORAID VG
> - create LV
> - reboot
> - VG found by vgscan.
> 
> Note that VG was entirely destroyed between each attempt. Pvcreate
> rerun.

Ah, I'm sorry to hear of that. 
 
> Idea?

Not really, and the evidence has been destroyed now. I do doubt that the name
had anything to do with it though.

patrick
