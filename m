Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92D9D47A43
	for <linux-lvm@lists.linux.dev>; Mon, 22 Jan 2024 11:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922550; cv=none; b=k6ueVrXcm/1SY/Fyw/uFck4AA/WCop0eSlB5EM26xudUgXjdTRvBRuU0J9zt/9P5o3Npg2PeycjucFiEPBcBOUyiSuBVO6DUctfxMNgb8/1ciaf/mZcj9k9tQKOhB60/oWVBEGMnz8VUYeeOLFL8uTOVK7u4dHUVt4ETNhcS4QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922550; c=relaxed/simple;
	bh=r58Dm3svGcYRmsIvHK8x1YonflVdyJbEjgeOSsaFsHg=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:Cc:To; b=W//p9YyUTmKZuP8n1huzWmZVrlLPVtW13Scdt9+mIFPA3cXKbHRjaV9EMqNaFOHI9oayCKj+CR3wcvEHbALDHNBcTZ/n6lXCbJnGe42bzbzPyx4EsmBGuTP+fKof2Fyg2Knnd3uthvzCaK0w+FN4d+QApWnubgxzbOoPMhkiAPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=cFXxX/Rx; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="cFXxX/Rx"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2cdeb808889so32259771fa.3
        for <linux-lvm@lists.linux.dev>; Mon, 22 Jan 2024 03:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705922546; x=1706527346; darn=lists.linux.dev;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TjrT360b/WiUJJBN9fdbVfR3yxhxtpzorKRw/aH45Yw=;
        b=cFXxX/RxvlLeqCVUdn2AkS0SX9Sby2m8ezk0cxx2QtdpXNZsvCSn8t0p6S9Y7ugoSf
         Gx1HWHodxhN1/F658yDzRGb9MRtf52i/25Eh0VZgLwmMqtgP8mGWPopvZgUtzBfw7a+/
         qd58rP7VWlpsuVo+DElwIIEko64fPHNrT2q5rer8Tocre+NE4C29pfCoPpfYPaal/nSJ
         QWnOqRi4CstrkyarLmjq1CAa4Ti4Glciq3fwFLhVFRtGZuR99oC2ibNfFhMiutVe9QeV
         mspOdO1mhf2Iu+gZGySEl5tAf0acZtzwrWAh9PcewbsV/9KvJIneD+96HcxQxgVHcCfK
         kotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922546; x=1706527346;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TjrT360b/WiUJJBN9fdbVfR3yxhxtpzorKRw/aH45Yw=;
        b=Ri22ywuVIkwJTlmtFnsGfsBl6vhF+5tY4tzkdgTqphpPyLR2mOXjdlMj//YU4v/BQ/
         FhQ43h+k3N8YRdo3ILtADunJH4l8JkdMcDoqw33WPs+EXYfY8Z5Gnc/gBVP7SCSeSnC2
         aENBvJPCWsJjbaMLoJ/ARsuOX4v4EnSWBFkFeOk42kmeO2Q22u44ZWIykeefeuVu6aXo
         9ya4HHRHD4d75D/JaKnEUcCEkCpO0MQnFLDsHvku9H8Rig3yf6YtejjyMUbvm87+STd5
         fAorkxODcVL3DVL0qMWYnAh5oG06V5KPMiwyZls610HV/iBQ0G9aiMl5HoQQrQKh7OhX
         QuAQ==
X-Gm-Message-State: AOJu0YyLjd/Mss5df3ytvciBCZkicuX/CzSb0049P6RIdU85ZcoG2zEm
	8Hfua40RWW7ezpjzvH32D1LwVLaPDAyyodMRr0t3HhPJefDaygGWfGgIe7raU4w6Cq2rdlkIdNk
	a2LA=
X-Google-Smtp-Source: AGHT+IFBzzCUqKAtupim2BwEr8Wn2DlL9NroCoo2dGkUMMhX2m4JpL/DiOr0cMzW3dD0RENjE7WdFA==
X-Received: by 2002:a2e:9113:0:b0:2cc:77b0:7655 with SMTP id m19-20020a2e9113000000b002cc77b07655mr1518740ljg.8.1705922545937;
        Mon, 22 Jan 2024 03:22:25 -0800 (PST)
Received: from smtpclient.apple ([23.247.139.60])
        by smtp.gmail.com with ESMTPSA id a1-20020a170902900100b001d5e7221082sm7048713plp.238.2024.01.22.03.22.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jan 2024 03:22:24 -0800 (PST)
From: Su Yue <glass.su@suse.com>
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-lvm@lists.linux.dev
List-Id: <linux-lvm.lists.linux.dev>
List-Subscribe: <mailto:linux-lvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-lvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.200.91.1.1\))
Subject: [Question] why not flush device cache at _vg_commit_raw
Message-Id: <A4568496-76AE-479C-8B80-F27D7EBC1DEB@suse.com>
Date: Mon, 22 Jan 2024 19:22:09 +0800
Cc: Heming Zhao <heming.zhao@suse.com>,
 Anthony Iliopoulos <ailiopoulos@suse.com>,
 Lidong Zhong <lidong.zhong@suse.com>,
 martin.wilck@suse.com
To: linux-lvm@lists.linux.dev
X-Mailer: Apple Mail (2.3774.200.91.1.1)

Hi lvm folks,
  Recently We received a report about the device cache issue after =
vgchange =E2=80=94deltag.
What confuses me is that lvm never calls fsync on block devices even at =
the end of commit phase.

IIRC, it=E2=80=99s common operations for userspace tools to call =
fsync/O_SYNC/O_DSYNC while writing=20
critical data. Yes, lvm2 opens devices with O_DIRECT if they support , =
but O_DIRECT doesn't=20
provide data was persistent to storage when write returns. The data can =
still be in the device cache,
If power failure happens in the timing, such critical metadata/data like =
vg metadata could be lost.

Is there any particular reason not to flush data cache at VG commit =
time?=20

Thanks
=E2=80=94
Su=
