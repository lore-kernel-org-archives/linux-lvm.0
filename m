Date: Thu, 20 Sep 2001 08:31:16 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] Unresolved symbols in lvm-mod.o
Message-ID: <20010920083116.C551@tykepenguin.com>
References: <550C100A8350CE4BBD3DD2D7788FD0CA481FBD@fcmail1.FC.COM>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <550C100A8350CE4BBD3DD2D7788FD0CA481FBD@fcmail1.FC.COM>; from bbailey@fcmail.org on Tue, Sep 18, 2001 at 11:06:52AM -0500
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

On Tue, Sep 18, 2001 at 11:06:52AM -0500, Brian Bailey wrote:
> We're making progress in our LVM setup (Redhat 7.1, kernel 2.4.3-6, lvm
> 1.0) and finally have a lvm-mod.o file in /md, however, when we run
> depmon -a we receive the "unresolved symbols in /md/lvm-mod-o" error.
> 
> As far as we can tell, everything else in the various steps ran well.
> Suggestion?

Which symbols are undefined ?

patrick
