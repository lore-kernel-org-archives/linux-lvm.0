From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] mounting ext3 snapshot occasionaly fails
Message-ID: <20021203124412.GJ2227@tykepenguin.com>
References: <F75jCnVGx3R6Vf8xccu0002a6be@hotmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <F75jCnVGx3R6Vf8xccu0002a6be@hotmail.com>
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
Date: Tue Dec  3 06:44:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Dec 03, 2002 at 12:35:09PM +0000, Tomaz Beltram wrote:
> Hi,
> 
> I have similar problems as described in this mailing list some months ago, 
> regarding mounting snapshots of journaled file systems.
> 
> Mounting the snapshot fails and dmesg shows:
> EXT3-fs: INFO: recovery required on readonly filesystem.
> EXT3-fs: write access unavailable, cannot proceed.
> 
> I have observed that the failure is more frequent with longer delays 
> between snapshot creation and mount time.
> 
> The problem was solved with the VFS-lock patch for 2.4.18 kernel. But I am 
> using LVM 1.0.5 and 2.4.19-SuSE kernel (64GB-SMP). As I understand, it 
> should already have the VFS-lock patch applied. If not, where can I find 
> one?

I don't know whether the SuSE kernel has the VFS lock patch applied or not - if
not then one for 2.4.19 is available in the LVM 1.0.6 source package.

The patch is agains the Linus kernel so whether it will apply to the SuSE
kernel is something you'll have to find out for yourself I'm afraid !

patrick
