Date: Tue, 25 Apr 2000 10:51:06 +0200
From: bert hubert <ahu@ds9a.nl>
Subject: Re: [linux-lvm] mounting lv's from fstab
Message-ID: <20000425105105.A31391@home.ds9a.nl>
References: <39053E22.D84F870F@netconnect.com.au>
Mime-Version: 1.0
In-Reply-To: <39053E22.D84F870F@netconnect.com.au>; from bug1@netconnect.com.au on Tue, Apr 25, 2000 at 04:41:38PM +1000
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "linux-lvm@msede.com" <linux-lvm@msede.com>

On Tue, Apr 25, 2000 at 04:41:38PM +1000, bug1 wrote:
> I put all my logical volumes in /etc/fstab but it doesnt work
> automatically.
> 
> Everytime i restart my machine i have to manually activate my volume
> group by typing vgchange -a y archive.
> 
> Is there a way of automatically doing this with lvm or would i have to
> write an init script ?

You have to write an initscript - that's just the way it is.

Regards,

bert hubert

-- 
                       |              http://www.rent-a-nerd.nl
                       |                     - U N I X -
                       |          Inspice et cautus eris - D11T'95
