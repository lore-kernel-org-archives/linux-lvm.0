From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] DM encryption target?
Message-ID: <20030924142145.GV12384@shell.blacknet.de>
References: <1064332301.5845.8.camel@david.internal.NorcrossGroup.com> <1064343664.10276.3.camel@chtephan.cs.pocnet.net> <3F717F13.1050407@silicide.dk> <1064404776.5915.9.camel@chtephan.cs.pocnet.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1064404776.5915.9.camel@chtephan.cs.pocnet.net>
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
Date: Thu Sep 25 08:03:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Sep 24 '03 at 13:59, Christophe Saout wrote:
> Another way to do a password change would be to not reencrypt the device
> but to store the symmetrical key somewhere else and encrypt it with a
> password hash and to just reencrypt that key with another password.
That would be nice, just use the first block for the key (giving you
512byte keysize, and you can generate a realy strong key[*]).

Just in idea.

[*] yes, i know it's only as strong as the user's password. 
    Security is only as good as it's weekest link, and in the end
    that's always the user.
-- 
/"\ Goetz Bock at blacknet dot de  --  secure mobile Linux everNETting
\ /                     (c) 2003 as GNU FDL 1.1
 X   [ 1. Use descriptive subjects - 2. Edit a reply for brevity -  ]
/ \  [ 3. Reply to the list - 4. Read the archive *before* you post ]
