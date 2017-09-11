Date: Mon, 11 Sep 2017 11:55:30 -0500
From: David Teigland <teigland@redhat.com>
Message-ID: <20170911165530.GA2046@redhat.com>
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: list@xenhideout.nl, linux-lvm@redhat.com

On Mon, Sep 11, 2017 at 03:11:06PM +0200, Zdenek Kabelac wrote:
> > Aye but does design have to be complete failure when condition runs out?
> 
> YES

I am not satisfied with the way thin pools fail when space is exhausted,
and we aim to do better.  Our goal should be that the system behaves at
least no worse than a file system reaching 100% usage on a normal LV.
