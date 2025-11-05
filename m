Received: from mo4-p05-ob.smtp.rzone.de (mo4-p05-ob.smtp.rzone.de [85.215.255.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F47930F811
	for <linux-lvm@lists.linux.dev>; Wed,  5 Nov 2025 19:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=85.215.255.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762372063; cv=pass; b=e2rj5PWgO3PGnMWe2NQHhO6slJ35SgySdWmgh76xjcOYSKPj45q96i6CGFJcuViODd6NI00/N1pLbKsA75m9DZ1kpxi19fz5wxScvWNYH5wyqfdFR0qULmHjXDNfyA+irv2cSwCVbC52NKsgWKa/gbAb8DQztq1KmzRUby9svTY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762372063; c=relaxed/simple;
	bh=Y3dkn0KAa42U3qeWKHxrYLdylF82Bu4AFH/GXUjXxII=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type; b=L8KtwIvxEcK2N8OFrT0GCTLlJIwViiBvtgKHXGL893hc3Yvg52vMxJFMUjpLKjXgRDBVpFyFQC8IEs51l0KxUeUa4S4dTYIBV3RrG6lP6k6+D5Gc+bnDTRW+r7SpDAzeuVGvN3pSkeltwaXZ9QazqduXAsHsIg2+Jk1AHNmXBCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=redjard.org; spf=none smtp.mailfrom=redjard.org; dkim=pass (2048-bit key) header.d=julianahl.de header.i=@julianahl.de header.b=aqwt1fRo; arc=pass smtp.client-ip=85.215.255.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=redjard.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=redjard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=julianahl.de header.i=@julianahl.de header.b="aqwt1fRo"
ARC-Seal: i=1; a=rsa-sha256; t=1762371873; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=UZsvW+NjvmjapyjMt28i340sDFBi1mPrG1z3TxWGRssI0VpTfZ1LaZ4VFmy8iGh68I
    p2voB/JUY2gCxYwFyV72hUhVsXwJSk36wzBOensaLDH8bPQRV8gLaPNu8D/XnYqr3Yoi
    ovom2FtfUlNWOTxHv3VrfCzj/YC3u+ncA5d7s41XIaS3y8p3+mi9ole/NRbiP7qDrjyP
    faVTtgvx1tL+EgYQdqt4rmaxi6h98isA+ShdMN7XF+a53EakMPn0yZdCmjjJhxl0us8E
    /+cKJNGRxbrUEhhK230zLazy7XCqB6H3hO+WJnCc5+6NmSVcheAugTioOiOkNtOHUbxW
    U9ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1762371873;
    s=strato-dkim-0002; d=strato.com;
    h=To:Subject:From:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=P16B4ZTFmDnEPGDEKhjGLFye27lfY34Y8rP9LnLh87E=;
    b=qmbbBX6TB5JzDlIiR2QXkNnIOisD6JMxExr2tsu1C5NpH+ph1jh6JFV49kXlmeNR+D
    a6Gjjz6eMKb+NFsBPC5ugQBbyvGX3bOkjWsmUnuHixnMmfYAo1a8O/OhgA9wCXOGNgLr
    BzkzqtOHHHlhSJ764NjUnSD0bxDW6s+0bem5nZcdUT5iNpuqfpp9usmS9UgoQ6v1iZK/
    DdMeL/710j5lS6ywct3oTKzTG5gj9kum9VoFKhYqhaEh0eBMqXhzoeMZwVJrProj8eYo
    XN0gFkB6zhbA6HC7UMH53jWsdHhWd4VPx+q1xvbeVg9d1eEff9dJFLptXmg32R70FUUH
    Meiw==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1762371873;
    s=strato-dkim-0002; d=julianahl.de;
    h=To:Subject:From:Date:Message-ID:Cc:Date:From:Subject:Sender;
    bh=P16B4ZTFmDnEPGDEKhjGLFye27lfY34Y8rP9LnLh87E=;
    b=aqwt1fRoBtRonHzTzmoYKPSLgw0RC/ZvtKeoZE6QJcjiju0pyIDHeSCdL/e6Dayt4y
    wu7wB64koIvsNItGphK/JBAWI90Yh1ech8MpkHBs3xgnjumWrqobOlJ8I12lpiMCVda4
    OGTugxFLBkIJ6fPRolfKnkROD+/mLEPzTFnzjYqlOQhwvhOfovO6K0IexldW4GR43RCb
    FGG/Vfc/ayLOB+v3YbZSVcXoIkmr/Jkp5FouXXSoCfPnvkhIuEp4Ig3M8/t4A9HjHNjh
    nNigpDdoRSC0TcnHROuClGB6/MArYnr68wY7RfMWQkiWX2i0xDU1AW7qLNzruFG290VH
    hvow==
X-RZG-AUTH: ":IW0NeWCibvMmK58ymXT0Q7yk7ZqulkjNLYFJaljAlIaklcqpfZ8AMeEUzC6Q8RJ4TEhjsp7BAC+AMPNmxtHQMBqb8YqC/ME="
X-RZG-CLASS-ID: mo05
Received: from [IPV6:2001:4dd0:2ba6:0:7285:c2ff:fefc:a754]
    by smtp.strato.de (RZmta 53.4.2 AUTH)
    with ESMTPSA id Y292ec1A5JiXAaR
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate)
    for <linux-lvm@lists.linux.dev>;
    Wed, 5 Nov 2025 20:44:33 +0100 (CET)
Message-ID: <68d055cb-bdfd-4ae1-bd14-d03735c3e5f5@redjard.org>
Date: Wed, 5 Nov 2025 20:44:33 +0100
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: redjard <lvm.linux@redjard.org>
Subject: Question on lvm read-only-ness when mounting in an initramfs on
 restore
To: linux-lvm@lists.linux.dev
Content-Language: en-US, de-DE
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

I am working on an initramfs-generator (µgRD) focused on stability. In 
discussion with the main dev of the project, the question was raised if 
our initialization code for LVM would cause issues if we then resume a 
prior running system using those same volumes.

Specifically we run
vgchange -ay
vgscan --mknodes

and would then resume, potentially from swap located inside volumes or 
potentially elsewhere.

If these two commands could change the state of the disk in any way, 
there would be potential that this disparity between disk state and the 
state of the then resumed systems cache and kernel could spiral into 
serious issues, in the worst case data loss.


Is there any chance of the disk state being changed by those commands?

--
redjard
