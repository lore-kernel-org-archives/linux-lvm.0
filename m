From: jon+lvm@silicide.dk
Subject: Re: [linux-lvm] DM encryption target?
Message-ID: <20030924145220.GA848@gw.silicide.dk>
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
Date: Wed Sep 24 09:53:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Sep 24, 2003 at 01:59:36PM +0200, Christophe Saout wrote:
> Am Mi, 2003-09-24 um 13.25 schrieb Jon Bendtsen:

[cut]
 
> Another way to do a password change would be to not reencrypt the device
> but to store the symmetrical key somewhere else and encrypt it with a
> password hash and to just reencrypt that key with another password.

this is what we use in our approach. But it's not quite ready
yet. Hint... store the key atleast 2 places...



JonB
