From: Chris Mason <mason@suse.com>
Subject: Re: [linux-lvm] kernel: zam-7001: io error in reiserfs_find_entry
Message-Id: <51880000.1010759924@tiny>
In-Reply-To: <20020111110146.GE1274@tykepenguin.com>
References: <22543.1010745017@joergli.cocolab.de>
    <20020111103718.GA1274@tykepenguin.com>
    <20020111114737.A22576@codingtechnologies.de>
    <20020111110146.GE1274@tykepenguin.com>
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
Date: Fri Jan 11 08:39:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com


On Friday, January 11, 2002 11:01:46 AM +0000 Patrick Caulfield
<caulfield@sistina.com> wrote:

> On Fri, Jan 11, 2002 at 11:47:37AM +0100, Thomas Ziegler wrote:
>> 
>> Some Questions to LVM and snapshots:
>> 
>> - Do other filesystems cope in a better way with a full snapshot than
>> reiserfs? 

I've started cleaning these and a few other io related errors up, this
won't be an open issue much longer.

-chris
