Date: Mon, 31 Jan 2000 15:32:48 +0100
From: "Andi Kleen" <ak@suse.de>
Subject: Re: [linux-lvm] Reduced dependecies for /root on lvm
Message-ID: <20000131153248.A9022@gruyere.muc.suse.de>
References: <389581F1.FC558D26@ep-ag.com>
Mime-Version: 1.0
In-Reply-To: <389581F1.FC558D26@ep-ag.com>; from stb@ep-ag.com on Mon, Jan 31, 2000 at 01:37:05PM +0100
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Klaus Strebel <stb@ep-ag.com>
Cc: linux-lvm@msede.com

On Mon, Jan 31, 2000 at 01:37:05PM +0100, Klaus Strebel wrote:
> Comments and bugreports are welcome.

I don't think it will work with sub directories. dp->d_type
is normally DT_UNKNOWN on all Linux systems, libc5 dirent
does not even have that field. Please use a fstat. 

-Andi
