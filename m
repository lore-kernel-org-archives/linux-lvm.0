From: Nils Juergens <nils@muon.de>
Subject: Re: [linux-lvm] Help : pvmove -- not enough free/allocatable physical extents
Message-ID: <20030722192109.GA605@trip.muon.local>
References: <BAY1-F141ddbQYaBzkg00020a7c@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <BAY1-F141ddbQYaBzkg00020a7c@hotmail.com>
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
Date: Tue Jul 22 12:22:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, 22.07.03, kiran dalvi <kiran_bd@hotmail.com> wrote:

> I haved created volume group using 3 partitions on my machine
> (/dev/hda7,/dev/hda8,/dev/hda9).All the partions are of same size 200 
> MB.Then
> I have created stripped logical volume on 3 partitions using following 
> command.
> 
> #lvcreate -i3 -I4 -l24 -nmy_stripped_lv1 my_volume_group
> 
> I have also tried extending logical volume and shrinking logical volume. All
> this worked fine for me.
> 
> Now I tried pvmove command.
> 
>        #pvmove /dev/hda9
> 
> But it will be giving following error message

[snipped]

My guess is that lvm wont move your pe's to one of the other partitions
because the lv is striped across three different partitions and pvmoving one
of the stripes to a partition with another stripe already on it would defy
the purpose of multi-striped lvs.

So the error message is a bit missleading but still correct. Lvm has nowhere
to move the pe's from /dev/hda9 to, because it tries to keep the lv across
three different partitions.

cya,

Nils


-- 
Nils Juergens  | nils@muon.de | icq 7090774
Having problems sending big files over the net?
Try out Efisto (http://efisto.rnbhq.org).
