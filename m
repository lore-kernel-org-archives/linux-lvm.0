Date: Tue, 18 Apr 2000 13:45:11 +0200
From: bert hubert <ahu@ds9a.nl>
Subject: Re: [linux-lvm] pvmove broken?
Message-ID: <20000418134511.A2298@home.ds9a.nl>
References: <20000411135841.A30143@home.ds9a.nl> <200004181037.MAA31399@u9etz.ez-darmstadt.telekom.de>
Mime-Version: 1.0
In-Reply-To: <200004181037.MAA31399@u9etz.ez-darmstadt.telekom.de>; from mauelsha@EZ-Darmstadt.telekom.de on Tue, Apr 18, 2000 at 12:37:31PM +0200
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

On Tue, Apr 18, 2000 at 12:37:31PM +0200, Heinz Mauelshagen wrote:
> 
> Maybe you hit the lvchange bug (see the BUGS file at linux.msede.com)
> and pvmove only complained as a followup?

That might have been hit. Currently, with pached lvchange, and improved
understanding, it works wonderfully. HOWTO has been updated to this effect,
though I still need to strip the FIXME.

Regards,

bert hubert

-- 
                       |              http://www.rent-a-nerd.nl
                       |                     - U N I X -
                       |          Inspice et cautus eris - D11T'95
