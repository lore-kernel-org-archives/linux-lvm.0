Date: Fri, 14 Sep 2001 09:51:33 -0400
From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] Lock Patch
Message-ID: <2481270000.1000475493@tiny>
In-Reply-To: <20010914095500.A813@tykepenguin.com>
References: <NBBBJHKIOKPKOGOEPEDPIEFCDNAA.stuart@bh90210.net>
 <20010914095500.A813@tykepenguin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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
To: linux-lvm@sistina.com


On Friday, September 14, 2001 09:55:00 AM +0100 Patrick Caulfield
<caulfield@sistina.com> wrote:

> On Thu, Sep 13, 2001 at 11:00:47PM -0700, IT3 Stuart B. Tener, USNR-R
> wrote:
>> List members:
>> 
>> 	I am curious; if I am running 2.4.8-12mdk (Mandrake 8,0), which lock
>> 	patch do I use the 2.4.4 version or the 2.4.9 version?
>> 
>> 
> 
> I would try the 2.4.4 one. If that doesn't apply then try the 2.4.9.

You could also look for drop_super() in fs/super.c.  If it is there, use
the 2.4.9 patch, if it isn't, use the 2.4.4 patch.  I'm guessing you'll
need the 2.4.4 one.

-chris
